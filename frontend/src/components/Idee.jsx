import React from "react";
import PropTypes from "prop-types";

import "../assets/styles/Idee.css";
import imagebg from "../assets/backgroundIdee.png";
import emptyFavIcon from "../assets/emptyFavIcon.svg";
import commentIcon from "../assets/commentIcon.svg";
import likeIcon from "../assets/likeIcon.svg";
import avatar from "../assets/avatar1.svg";

function Idee({
  id,
  title,
  modified,
  comments,
  likes,
  published,
  theme,
  selected,
  setSelected,
}) {
  const handleOpen = () => {
    setSelected(id);
  };

  return (
    <div
      className="ideaContainer"
      onClick={handleOpen}
      role="button"
      onKeyDown={handleOpen}
      tabIndex={0}
    >
      {id !== selected ? (
        <div className="titleContainerSmall">
          <div className="avatar">
            {" "}
            <img src={avatar} alt="avatar" />
          </div>
          <div className="titleIdeaSmall">
            {title} <img src={emptyFavIcon} alt="emptyfavicon" />
          </div>
          <div className="modifiedIdeaSmall">Modifiée le {modified}</div>
          <div className="commentsandlikesSmall">
            <img src={commentIcon} alt="commenticon" /> {comments}{" "}
            <img src={likeIcon} alt="likesicon" /> {likes}
          </div>
        </div>
      ) : (
        <div className="ideaContainerBig">
          <div className="titleContainerBig">
            <div className="avatar">
              {" "}
              <img src={avatar} alt="avatar" />
            </div>
            <div className="titleIdeaBig">
              {title} <img src={emptyFavIcon} alt="emptyfavicon" />
            </div>
            <div className="commentsandlikesBig">
              {" "}
              <img src={commentIcon} alt="commenticon" />
              {comments} <img src={likeIcon} alt="likeicon" /> {likes}
            </div>
          </div>
          <div className="theme">Thème : {theme}</div>
          <div className="published">Publiée par : {published}</div>
          <div className="textIdea">
            Lorem ipsum dolor sit amet. Non nulla mollitia sed atque tenetur et
            sint quam aut cumque perferendis quo quae veritatis ut maxime optio
            in mollitia autem. Et necessitatibus suscipit eos voluptatibus
            consequatur quo veniam quod quo nobis voluptatem. Non tenetur
            pariatur et magni veniam Lorem ipsum dolor sit amet. Non nulla
            mollitia sed atque tenetur et sint quam aut cumque perferendis quo
            quae veritatis ut maxime optio in mollitia autem. Et necessitatibus
            suscipit eos voluptatibus consequatur quo veniam quod quo nobis
            voluptatem. Non tenetur pariatur et magni veniam
          </div>

          <div className="imageIdea">
            <img src={imagebg} alt="" />
          </div>

          <div className="bottomIdea">
            <div className="resources">
              Ressources : <br />1 : <br />2 : <br />3 :
            </div>
            <div className="modifiedIdeaBig">Modifiée le {modified}</div>
          </div>
        </div>
      )}
    </div>
  );
}
Idee.propTypes = {
  id: PropTypes.number.isRequired,
  title: PropTypes.string.isRequired,
  modified: PropTypes.string.isRequired,
  comments: PropTypes.number.isRequired,
  likes: PropTypes.number.isRequired,
  published: PropTypes.string.isRequired,
  theme: PropTypes.string.isRequired,
  selected: PropTypes.func.isRequired,
  setSelected: PropTypes.func.isRequired,
};

export default Idee;
