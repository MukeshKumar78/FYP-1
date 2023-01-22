import custom from './custom.vue';

console.log(custom);
SBA.use({
  install({viewRegistry}) {
    viewRegistry.addView({
      name: 'custom',  
      path: '/custom', 
      component: custom, 
      label: 'AAAAAAAA', 
      order: 1000, 
    });
  }
});
