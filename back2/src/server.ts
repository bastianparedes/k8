import routes from './routes';
import type { FastifyInstance } from 'fastify';
import cors from '@fastify/cors';

const options = {};

export { options };
export default (server: FastifyInstance) => {
  server.register(routes, {
    prefix: '/'
  });

  server.register(routes, {
    prefix: '/s/experiments'
  });

  server.register(cors, {
    origin: [
      'https://www.falabella.com',
      'www.falabella.com',
      'https://sodimac.falabella.com',
      'sodimac.falabella.com',
      'https://tottus.falabella.com',
      'tottus.falabella.com',
      'https://linio.falabella.com',
      'linio.falabella.com',
      'https://www.falabella.com.pe',
      'www.falabella.com.pe',
      'https://sodimac.falabella.com.pe',
      'sodimac.falabella.com.pe',
      'https://tottus.falabella.com.pe',
      'tottus.falabella.com.pe',
      'https://linio.falabella.com.pe',
      'linio.falabella.com.pe',
      'https://www.falabella.com.co',
      'www.falabella.com.co',
      'https://homecenter.falabella.com.co',
      'homecenter.falabella.com.co',
      'https://linio.falabella.com.co',
      'linio.falabella.com.co'
    ]
  });

  return server;
};
