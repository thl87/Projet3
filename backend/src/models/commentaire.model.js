const connection = require("../config/db");

// create

const create = (detail, date, utilisateurIdutilisateur, ideeIdidee) => {
  return connection.query(
    "INSERT INTO commentaire ( detail, date, utilisateur_idutilisateur, idee_ididee) VALUES (?,?,?,?)",
    [detail, date, utilisateurIdutilisateur, ideeIdidee]
  );
};

// read
const findAll = () => {
  return connection.query("SELECT * FROM  commentaire;");
};

const findById = (id) => {
  return connection.query("SELECT * FROM commentaire WHERE idee_ididee =?", [
    id,
  ]);
};

const findUserByComment = (id) => {
  return connection.query(
    "SELECT * FROM utilisateur INNER JOIN commentaire on id = utilisateur_idutilisateur WHERE idcommentaire =?",
    [id]
  );
};

// //update
// const updateIdea = (theme, titre, description, archive, id) => {
//   return connection.query("UPDATE idee SET theme=?, titre=?, description=?, archive=?, WHERE id=?", [theme, titre, description, archive, id]);
// }

// delete
const deleteComment = (id) => {
  return connection.query("DELETE FROM commentaire WHERE idcommentaire=?", [
    id,
  ]);
};

module.exports = {
  create,
  findAll,
  findById,
  findUserByComment,
  //   updateIdea,
  deleteComment,
};
