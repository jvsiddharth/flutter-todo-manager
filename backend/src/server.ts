import 'dotenv/config';
import Fastify from 'fastify';
import swagger from '@fastify/swagger';
import swaggerUI from '@fastify/swagger-ui';
import sql from './config/db';

import { taskRoutes } from './modules/tasks/task.routes';

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

// db health route
app.get('/db-health', async (request) => {
  try {
    await sql`SELECT 1`;
    return { dbStatus: 'ok' };
  } catch (error) {
    return { dbStatus: error };
  }
});

app.register(taskRoutes);

// Start the server
app.listen({ port: Number(process.env.PORT) || 3000, host: '0.0.0.0' });
