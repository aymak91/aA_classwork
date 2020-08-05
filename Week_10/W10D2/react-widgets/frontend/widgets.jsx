import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';

const tabs = [
    { title: 'one', content: 'I  am the first'},
    { title: 'two', content: 'Second pane here'},
    { title: 'three', content: 'Third pane here'}
];

function Root() {
    return (
        <div>
            <h3>Clock</h3>
            < Clock />
            <h3>Tabs</h3>
            < Tabs tabs={tabs} />
        </div>
    );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(< Root />, document.getElementById('root'));
});