import type { FastifyInstance } from 'fastify';

const routes = async (server: FastifyInstance) => {
  server.get('/', {}, async (req, reply) => {
    const response = await fetch(process.env.DOMAIN_BACK_2 as string);

    const json = await response.json();
    reply.code(200).send({ sentFromBack1: { responseBack2: json } });
  });

  server.get('/common', {}, (req, reply) => {
    reply.code(200).send('common desde back-1');
  });

  server.get('/back-1', {}, async (req, reply) => {
    reply.code(200).send('back-1');
  });

  server.get('/back-2-url', {}, async (req, reply) => {
    reply.code(200).send(process.env.DOMAIN_BACK_2);
  });
  return server;
};

export default routes;
