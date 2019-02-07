<template>
  <v-app>
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
    >
      <v-list>
        <v-btn icon @click.stop="miniVariant = !miniVariant">
          <v-icon>{{ `chevron_${miniVariant ? "right" : "left"}` }}</v-icon>
        </v-btn>
        <v-list-tile
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title v-text="item.title" />
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar :clipped-left="clipped" fixed app>
      <v-toolbar-side-icon @click="drawer = !drawer" />
      <v-toolbar-title v-text="title" />
      <v-spacer></v-spacer>
      <div v-for="locale in $i18n.locales" v-bind:key="locale.code">
        <nuxt-link
          v-if="locale.code !== $i18n.locale"
          :key="locale.code"
          :to="switchLocalePath(locale.code)"
        >
          {{ locale.shortName }}
        </nuxt-link>
      </div>
    </v-toolbar>
    <v-content>
      <v-container>
        <nuxt />
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: "apps",
          title: "Home",
          to: "/"
        },
        {
          icon: "bubble_chart",
          title: "Categories",
          to: "/categories"
        }
      ],
      miniVariant: false,
      title: "Nuxt app"
    }
  }
}
</script>
