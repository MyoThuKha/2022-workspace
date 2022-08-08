import React, { Component } from "react";
import image from "../assets/menu/A/A.jpg";
class Item extends Component {
  state = {};
  render() {
    return (
      <React.Fragment>
        <div className="container">
          <div className="row justify-content-around">
            <div className="col-3">
              <div className="container bg-white rounded shadow m-2">
                <div className="pt-2 pb-5 justify-content-center">
                  <img className="rounded mx-auto d-block" src={image} alt="" />
                </div>
                <div className="lead justify-content-center">Ramen</div>
              </div>
            </div>
            <div className="col-3">
              <div className="container bg-white rounded shadow m-2">
                <div className="p-2 pb-5 justify-content-center">
                  <img className="rounded mx-auto d-block" src={image} alt="" />
                </div>
                <div className="lead justify-content-center">Ramen</div>
              </div>
            </div>
            <div className="col-3">
              <div className="container bg-white rounded shadow m-2">
                <div className="p-2 pb-5 justify-content-center">
                  <img className="rounded mx-auto d-block" src={image} alt="" />
                </div>
                <div className="lead justify-content-center">Ramen</div>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Item;
