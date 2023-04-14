import * as redis from 'redis';

const client = redis.createClient({ url: process.env.REDIS_URL || 'redis://localhost:6379' });

export default client;
