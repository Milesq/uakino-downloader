import { ECS } from '@aws-sdk/client-ecs'

const ecs = new ECS()

export default async function runDownloaderTask(params) {
  const {
    taskDefinition: { revision: latestRevision },
  } = await ecs.describeTaskDefinition({
    taskDefinition: process.env.TASK_DEF_NAME,
  })

  return ecs.runTask({
    cluster: process.env.CLUSTER_NAME,
    taskDefinition: `${process.env.TASK_DEF_NAME}:${latestRevision}`,
    launchType: 'FARGATE',
    networkConfiguration: {
      awsvpcConfiguration: {
        subnets: [process.env.SUBNET],
        assignPublicIp: 'ENABLED',
      },
    },
    overrides: {
      containerOverrides: [
        {
          name: 'main',
          environment: [
            {
              name: `UAKINO_PARAMS`,
              value: Buffer.from(JSON.stringify(params)).toString('base64'),
            },
          ],
        },
      ],
    },
  })
}
