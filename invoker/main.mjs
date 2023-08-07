import { resolve } from 'path'
import express from 'express'
import bodyParser from 'body-parser'
import serverless from 'serverless-http'
import { object, string, number } from 'yup'

import runDownloaderTask from './runTask.mjs'

const app = express()
app.use(bodyParser.urlencoded({ extended: true }))

app.get('/', (req, res) => {
  res.sendFile(resolve('index.html'))
})

const bodySchema = object({
  name: string().required(),
  parts: number().required(),
  url: string().required(),
  q: string().max(5).required(),
  'access-password': string().length(32).required(),
});

app.post('/', async (req, res, next) => {
  try {
    const {
      'access-password': accessPassword,
      q,
      name,
      parts,
      url,
    } = await bodySchema.validate(req.body, {abortEarly: true})

    req.data = {
      accessPassword,
      q,
      name,
      parts,
      url,
    };

    next()
  } catch (err) {
    console.log(err.message)
    return res.sendStatus(400)
  }
})

app.post('/', async (req, res) => {
  const { accessPassword, ...downloaderParams } = req.data

  if (accessPassword !== process.env.ACCESS_PASSWORD) {
    return res.sendStatus(401)
  }

  await runDownloaderTask(downloaderParams)
  res.sendStatus(201)
});

if (process.env.NODE_ENV === 'production') {
  exports.handler = serverless(app);
} else {
  app.listen(3000, () => {
    console.log(`Server is listening`);
  });
}
