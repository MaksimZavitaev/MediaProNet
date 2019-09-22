<template>
    <div>
        <ul class="hr">
            <li v-for="tab in tabs"
                :key="tab.id"
                :class="{'active': tab.active}">
                <component v-html="tab.title" @click="setTabActive(tab.id)"></component>
                <b class="remove" @click="removeTab(tab.id)">X</b>
            </li>
        </ul>
        <button @click="addTab">Add Tab</button>

        <tabs>
            <tab v-for="tab in tabs" v-if="tab.active">
                <tab-title v-html="tab.title"></tab-title>
                <tab-content v-html="tab.content"></tab-content>
            </tab>
        </tabs>

        <hr/>

        <button @click="visible = !visible">
            Toggle 3 tab
        </button>

        <tabs>
            <tab>
                <tab-title>
                    Title 1
                </tab-title>
                <tab-content>
                    <i>Content</i> 1
                </tab-content>
            </tab>
            <tab>
                <tab-title>
                    <i>Title</i> 2
                </tab-title>
                <tab-content>
                    Content 2
                </tab-content>
            </tab>
            <tab v-if="visible">
                <tab-title>
                    Title 3
                </tab-title>
                <tab-content>
                    Content 3
                </tab-content>
            </tab>
        </tabs>
    </div>
</template>

<style>
    .active {
        color: red;
    }

    ul.hr {
        margin: 0;
        padding: 4px;
    }

    ul.hr li {
        display: inline;
        margin-right: 5px;
        border: 1px solid #000;
        padding: 3px;
    }

    .remove {
        cursor: default;
    }
</style>

<script>
    import {Tabs, Tab, TabTitle, TabContent} from './components/tabs';

    export default {
        el: '#app',
        components: {
            Tabs,
            Tab,
            TabTitle,
            TabContent,
        },
        data() {
            return {
                visible: false,
                tabs: [
                    {
                        id: 1,
                        title: 'Title 1',
                        content: "<i>Content</i> 1",
                        active: true,
                    },
                    {
                        id: 2,
                        title: '<i>Title</i> 2',
                        content: 'Content 2',
                        active: false,
                    },
                    {
                        id: 3,
                        title: 'Title 3',
                        content: 'Content 3',
                        active: false,
                    },
                ],
            }
        },
        methods: {
            setTabActive(id) {
                this.tabs.map(tab => tab.active = false);
                this.tabs.find(tab => tab.id === id).active = true;
            },
            addTab() {
                let nextId = this.tabs.length > 0
                    ? Math.max(...this.tabs.map(tab => tab.id)) + 1
                    : 1;
                this.tabs.push({
                    id: nextId,
                    title: `Title ${nextId}`,
                    content: `Content ${nextId}`,
                    active: false,
                })
            },
            removeTab(id) {
                let tabIndex = this.tabs.findIndex(tab => tab.id === id);
                let tab = this.tabs[tabIndex];
                if (tab.active) {
                    this.tabs[0].active = true;
                }
                this.tabs.splice(tabIndex, 1);
            }
        }
    }
</script>
