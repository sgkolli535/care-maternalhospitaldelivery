const request = require("supertest");
const app = require("../index");

describe("GET /", () => {
  it("respond with hi", (done) => {
    request(app).get("/").expect("Hi", done);
  })
});