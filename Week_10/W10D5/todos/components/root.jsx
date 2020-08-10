import React from 'react';
import { Provider } from 'react-redux';
import App from './app';

const Root = ({ store }) => { // is there a difference between this vs taking in stores?
    return (
        <Provider store={store} >
            <App /> 
        </ Provider>
    );
};

export default Root;