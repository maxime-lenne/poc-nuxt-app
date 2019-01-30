<template>
  <v-layout
    column
    justify-center
    align-center
  >
    <v-data-table
      :headers="headers"
      :items="desserts"
      class="elevation-1"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.id }}</td>
        <td class="text-xs-right">{{ props.item.label }}</td>
      </template>
    </v-data-table>
  </v-layout>
</template>
<script>
import axios from '~/plugins/axios'
export default {
  data() {
    return {
      headers: [
        {
          text: 'Id',
          align: 'left',
          sortable: true,
          value: 'id'
        },
        { text: 'Label', value: 'label' }
      ],
      desserts: [],
      errors: []
    }
  },
  // Fetches posts when the component is created.
  created() {
    axios.get('/categories')
      .then((response) => {
        // JSON responses are automatically parsed.
        this.desserts = response.data
      })
      .catch((e) => {
        this.errors.push(e)
      })

    // async / await version (created() becomes async created())

    // try {
    //   const response = await axios.get(url)
    //   this.desserts = response.data
    // } catch (e) {
    //   this.errors.push(e)
    // }
  }
}
</script>
