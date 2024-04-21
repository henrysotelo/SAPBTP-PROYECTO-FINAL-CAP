const cds = require("@sap/cds");
const { Headers } = cds.entities("com.schema");

module.exports = (srv) => {
    // READ
    srv.on("READ", "Header", async (req) => {
        return await SELECT.from(Headers);
    });

    // CREATE
    srv.on("CREATE", "Header", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run(
                INSERT.into(Headers).entries({
                    email: req.data.email,
                    firstname: req.data.firstname,
                    lastname: req.data.lastname,
                    country: req.data.country,
                    createon: req.data.createon,
                    orderstatus: req.data.orderstatus,
                    deliverydate: req.data.deliverydate,
                    imageurl: req.data.imageurl
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.data;
                } else {
                    req.error(409, "Record Not Inserted");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });


    // UPDATE
    srv.on("UPDATE", "Header", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run([
                UPDATE(Headers, req.data.email).set({
                    firstname: req.data.firstname,
                    orderstatus: req.data.orderstatus
                }),
            ])
            .then((resolve, reject) => {
                console.log("Resolve: ", resolve);
                console.log("Reject: ", reject);

                if (resolve[0] == 0) {
                    req.error(409, "Record Not Found");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });


    // DELETE
    srv.on("DELETE", "Header", async (req) => {
        let returnData = await cds
            .transaction(req)
            .run(
                DELETE.from(Headers).where({
                    Email: req.data.Email,
                })
            )
            .then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (resolve !== 1) {
                    req.error(409, "Record Not Found");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return await returnData;
    });


};