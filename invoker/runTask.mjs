import { ECS } from '@aws-sdk/client-ecs'

const ecs = new ECS()

export default async function runDownloaderTask(params) {
  const {
    taskDefinition: { revision: latestRevision },
  } = await ecs.describeTaskDefinition({
    taskDefinition: 'uakino-downloader',
  })

  return await ecs.runTask({
    cluster: 'uakino-downloader-cluster',
    taskDefinition: `uakino-downloader:${latestRevision}`,
    launchType: 'FARGATE',
    networkConfiguration: {
      awsvpcConfiguration: {
        subnets: ['subnet-04de8313c5a7ebd9a'],
        securityGroups: ['sg-00f25ef36be95bb47'],
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
              value: btoa(JSON.stringify(params)),
            },
          ],
        },
      ],
    },
  })
}
