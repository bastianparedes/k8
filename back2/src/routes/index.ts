import type { FastifyInstance } from 'fastify';

const routes = async (server: FastifyInstance) => {
  server.get('/', {}, (req, reply) => {
    console.log('ayuda desde back 2', req.query);
    reply.code(200).send({ dataSentFromBack2: 2 });
  });

  server.get('/common', {}, (req, reply) => {
    reply.code(200).send('common desde back2');
  });

  server.get('/back-2', {}, async (req, reply) => {
    reply.code(200).send('back-2');
  });

  return server;
};

export default routes;
