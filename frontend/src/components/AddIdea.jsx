import React, { useState } from "react";
import "../assets/styles/AddIdea.css";

function AddIdea() {
  const themes = [
    {
      id: 1,
      nom: "Travail",
    },
    {
      id: 2,
      nom: "Loisirs",
    },
    {
      id: 3,
      nom: "Cohésion d'équipe",
    },
  ];

  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  return (
    <div className="mainIdeaContainer">
      <div className="details">
        <div className="titleIdea">
          <input
            className="titleIdeaInput"
            value={title}
            type="text"
            placeholder="Titre"
            onChange={(e) => setTitle(e.target.value)}
          />{" "}
        </div>
        {/* <div className="themeSelection"> */}
        <form className="themeSelectionForm">
          <label htmlFor="theme-select">
            <select id="theme-select">
              <option value="">---</option>
              {themes.map((theme) => (
                <option key={theme.id}>{theme.nom}</option>
              ))}
            </select>
          </label>
        </form>{" "}
        {/* </div> */}
        <div className="descriptionIdea">
          <textarea
            className="descriptionIdeaInput"
            value={description}
            type="text"
            placeholder="Décrivez votre idée"
            onChange={(e) => setDescription(e.target.value)}
          />
        </div>
      </div>
      <div className="fileAndLink">
        <div className="file">
          <div className="addFile">Ajouter un fichier</div>
          <button type="button">+</button>
        </div>
        <div className="link">
          <div className="addLink">Ajouter un lien</div>
          <button type="button">+</button>
        </div>
      </div>
      <div className="submission">
        <button className="annuler" type="button">
          Annuler
        </button>
        <button className="valider" type="button">
          Valider
        </button>
      </div>
    </div>
  );
}

export default AddIdea;
