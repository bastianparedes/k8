import fastify from 'fastify';
import registerSserver from './server';

const server = registerSserver(fastify());

server.listen({ port: 3000 });
