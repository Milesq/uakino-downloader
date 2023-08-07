const path = require('path')
const express = require('express')
const bodyParser = require('body-parser')
const serverless = require('serverless-http')
const yup = require('yup')

const app = express()
app.use(bodyParser.urlencoded({ extended: true }))

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'))
})

const bodySchema = yup.object({
  url: yup.string().required(),
  q: yup.string().max(5).required(),
  'access-password': yup.string().length(32).required()
});

app.post('/', async (req, res, next) => {
  try {
    const {
      'access-password': accessPassword,
      q,
      url
    } = await bodySchema.validate(req.body, {abortEarly: true, strict: true})

    req.data = {
      accessPassword,
      q,
      url
    };

    next()
  } catch (err) {
    console.log(err.message)
    return res.sendStatus(400)
  }
})

app.post('/', async (req, res) => {
  const {
    accessPassword,
    q,
    url
  } = req.data

  if (accessPassword !== process.env.ACCESS_PASSWORD) {
    return res.sendStatus(401)
  }

  // runEcsTask(url, q)
  res.sendStatus(201)
});

if (process.env.NODE_ENV === 'production') {
  exports.handler = serverless(app);
} else {
  app.listen(3000, () => {
    console.log(`Server is listening`);
  });
}
