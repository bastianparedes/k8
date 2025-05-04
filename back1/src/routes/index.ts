import type { FastifyInstance } from 'fastify';

const routes = async (server: FastifyInstance) => {
  server.get('/', {}, async (_req, reply) => {
    console.log('ayuda desde back 1');
    const response = await fetch(
      'http://back2-service.default.svc.cluster.local'
    );

    const json = await response.json();
    reply.code(200).send({ responseBack2: json });
  });

  return server;
};

export default routes;
