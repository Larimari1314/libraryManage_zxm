import {createApp} from 'vue'
import App from './App.vue'
const app = createApp(App)
import router from './router'
app.use(router).mount('#app')

import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import axios from 'axios'
const xhr = new XMLHttpRequest();
xhr.withCredentials = true;
axios.defaults.baseURL ='http://localhost:8080/';
axios.defaults.timeout = 5000;
axios.defaults.withCredentials = true;

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.use(ElementPlus)




