import express from 'express';
import morgan from 'morgan';
import helmet from 'helmet';
import cors from 'cors';
import { Request, Response } from 'express';

import { PrismaClient } from '@prisma/client'; // eslint-disable-line

const prisma = new PrismaClient();

import * as middlewares from './middlewares';
// import api from './api';
import MessageResponse from './interfaces/MessageResponse';

require('dotenv').config();

const app = express();

app.use(morgan('dev'));
app.use(helmet());
app.use(cors());
app.use(express.json());

app.get<{}, MessageResponse>('/', async (req: Request, res: Response) => {
  const allUsers = await prisma.users.findMany();
  console.log(allUsers);
  res.json({
    message: '🦄🌈✨👋🌎🌍🌏✨🌈🦄',
  });
});

// app.use('/api/v1', api);

app.use(middlewares.notFound);
app.use(middlewares.errorHandler);

export default app;
