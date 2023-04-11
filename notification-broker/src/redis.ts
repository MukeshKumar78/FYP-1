import * as redis from 'redis';

const client = redis.createClient({ url: process.env.REDIS_URL || '127.0.0.1:6379' });

export default client;
