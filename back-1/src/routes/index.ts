import type { FastifyInstance } from 'fastify';

const routes = async (server: FastifyInstance) => {
  server.get('/', {}, async (req, reply) => {
    const response = await fetch(
      'http://back-2-service.default.svc.cluster.local'
    );

    const json = await response.json();
    reply.code(200).send({ responseBack2: json });
  });

  server.get('/common', {}, (req, reply) => {
    reply.code(200).send('common desde back-1');
  });

  server.get('/back-1', {}, async (req, reply) => {
    reply.code(200).send('back-1');
  });

  return server;
};

export default routes;
