import 'dotenv/config';
import Fastify from 'fastify';
import swagger from '@fastify/swagger';
import swaggerUI from '@fastify/swagger-ui';

const app = Fastify({ logger: true });

app.register(swagger, {
  openapi: {
    info: {
      title: 'Smart Task Manager API',
      description: 'Task management API with automatic classification',
      version: '1.0.0',
    },
  },
});

app.register(swaggerUI, {
  routePrefix: '/docs',
  uiConfig: {
    docExpansion: 'list',
    deepLinking: false,
  },
});

// health route
app.get('/health', async (request) => {
  return { status: 'ok' };
});

app.listen({ port: Number(process.env.PORT) || 3000, host: '0.0.0.0' });
