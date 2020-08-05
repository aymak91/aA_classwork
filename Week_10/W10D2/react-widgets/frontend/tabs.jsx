import React from 'react';

export default class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.tabs = this.props.tabs;
        this.state = {
            selectedTab: 0,
            contentDisplayed: this.tabs[0]['content']
        }
        this.handleHeader = this.handleHeader.bind(this);
    }

    render() {
        this.tabs.forEach((tab, idx) => (tab.status = (this.state.selectedTab === idx) ? "selected" : ""));

        return (
            <div class="tabs">
                <ul class="tab-selector">
                    {this.tabs.map((tab, idx) => (<li
                        class={tab.status}
                        onClick={() => this.handleHeader(idx)}
                        key={idx}>
                            <h1>{tab.title}</h1>
                        </li>))}
                </ul>
                <p class="content">{this.state.contentDisplayed}</p>

            </div>
        );
    }

    handleHeader(idx) {
        const selectedTab = idx;
        const contentDisplayed =this.tabs[idx]['content'];
        this.setState({ selectedTab , contentDisplayed});
    }
}