const express = require("express");
// const cookieParser = require("cookie-parser");
require("dotenv").config({ path: "../config/.env" });
const cors = require("cors");
const path = require("path");

const multer = require("multer");

const upload = multer({ dest: "uploads/" });
const fs = require("fs");
const { v4: uuidv4 } = require("uuid");

const usersRoute = require("./routes/utilisateurs.route");

const themeRoute = require("./routes/theme.route");
const ideeRoute = require("./routes/idee.route");
const commentaireRoute = require("./routes/commentaire.route");
const serviceRoute = require("./routes/service.route");

const favorisRoute = require("./routes/favoris.route");

const app = express();

const corsOptions = {
  origin: process.env.FRONTEND_URL,
  credentials: true,
  allowedHeaders: ["sessionId", "Content-Type", "authorization"],
  exposedHeaders: ["sessionId"],
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE, OPTIONS",
  preflightContinue: false,
};
app.use(cors(corsOptions));

app.use(express.json());
// app.use(cookieParser());

app.use(express.static(path.join(__dirname, "..", "public")));

app.use("/api/utilisateur", usersRoute);

app.get("/", (req, res) => {
  res.status(200).send("yeah");
});

app.use("/api/idee", ideeRoute);
app.use("/api/commentaire", commentaireRoute);
app.use("/api/favoris", favorisRoute);

app.use("/api/theme", themeRoute);
app.use("/api/service", serviceRoute);

app.post("/api/ressource", upload.array("ressource", 5), (req, res) => {
  try {
    req.files.forEach((file) => {
      const { originalname } = file;
      const { filename } = file;
      fs.rename(
        `uploads/${filename}`,
        `uploads/${uuidv4()}-${originalname}`,
        (err) => {
          if (err) throw err;
        }
      );
    });

    return res.status(200).send();
  } catch (err) {
    return res.status(500).send(err);
  }
});

// ready to export
module.exports = app;
