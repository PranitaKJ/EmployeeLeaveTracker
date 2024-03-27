module.exports = srv => {
    srv.before('CREATE', 'MyEntity', async (req) => {
      const { empid } = await srv.tx(req).run(SELECT.one`SELECT nextval(empid) as empid FROM MySequence`);
      req.data.empid = empid;
    });
  };  