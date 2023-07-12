interface userData {
  _id?: object;
  name: string;
  email: string;
  isAdmin: boolean;
}
declare module 'express-serve-static-core' {
  interface Request {
    user: userData;
  }
}
