<template>
	<div class="text-left mb-4">
		<el-select
			v-model="academic"
			placeholder="ជ្រើសរើស"
			class="text-left "
		>
			<el-option
				v-for="data in academics"
				:key="data"
				:label="data.name"
				:value="data.id"
			/>
		</el-select>
	</div>
	<div class=" mb-4 ">
		<el-row :gutter="16">
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50">
					<el-statistic :value="4800">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">​សិស្សសរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="statistic-footer">
						<div class="footer-item">
							<span class="text-[16px]">ច្រើនឆ្នាំមុន </span>
							<span class="green text-[16px]">
								24%
								<el-icon>
									<CaretTop />
								</el-icon>
							</span>
						</div>
					</div>
				</div>
			</el-col>
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50">
					<el-statistic :value="98">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">​គ្រូសរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="statistic-footer">
						<div class="footer-item">
							<span class="text-[16px]">ច្រើនឆ្នាំមុន </span>
							<span class="green text-[16px]">
								2%
								<el-icon>
									<CaretTop />
								</el-icon>
							</span>
						</div>
					</div>
				</div>
			</el-col>
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50">
					<el-statistic :value="5">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">អ្នកប្រើប្រាស់សរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="statistic-footer">
						<div class="footer-item">
							<span class="text-[16px]">ច្រើនឆ្នាំមុន </span>
							<span class="green text-[16px]">
								2%
								<el-icon>
									<CaretTop />
								</el-icon>
							</span>
						</div>
					</div>
				</div>
			</el-col>
			<el-col :span="6">
				<div class="statistic-card border rounded  bg-gray-50">
					<el-statistic :value="65">
						<template #title>
							<div style="display: inline-flex; align-items: center">
								<div class="text-xl">​ថ្នាក់សរុប</div>

							</div>
						</template>
					</el-statistic>
					<div class="statistic-footer">
						<div class="footer-item">
							<span class="text-[16px]">ច្រើនឆ្នាំមុន </span>
							<span class="green text-[16px]">
								2%
								<el-icon>
									<CaretTop />
								</el-icon>
							</span>
						</div>
					</div>
				</div>
			</el-col>
		</el-row>
	</div>
	<div class="grid grid-cols-3 gap-4 ">
		<div class="col-span-2 border rounded  bg-gray-50">
			<div class="flex flex-col  ">
				<div class="py-2 text-xl">
					ទិន្នន័យអត្រាសិស្សានុសិស្សតាមថ្នាក់
				</div>
				<div>
					<apexchart
						type="bar"
						height="350"
						:options="optionsColumn.chartOptions"
						:series="optionsColumn.series"
					></apexchart>
				</div>

			</div>
		</div>
		<div class="border rounded  bg-gray-50">
			<div class="py-2 text-xl">
				ទិន្នន័យវត្តមាន
			</div>
			<div id="chartAttendace">
				<apexchart
					type="pie"
					width="380"
					:options="optionsAttendace.chartOptions"
					:series="optionsAttendace.series"
				></apexchart>
			</div>
		</div>

	</div>

	<!-- Dialog  -->
	<el-dialog
		v-model="dialogFormVisible"
		title="ព័ត៌មានអ្នកប្រើប្រាស់"
		class="sanfont-khmer"
		width="50%"
	>
		<el-form
			class="grid grid-cols-2"
			:model="ruleForm"
			:rules="rules"
			ref="ruleForm"
			id="fm"
		>
			<div>
				<el-form-item
					label="ឈ្មោះ"
					prop="name"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.name"
						autocomplete="off"
						name="name"
						clearable
					></el-input>
				</el-form-item>
				<el-form-item
					label="លេខទូរស័ព្ទ"
					prop="phone"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.phone"
						autocomplete="off"
						name="phone"
						clearable
					/>
				</el-form-item>
				<el-form-item
					label="សារអេឡិចត្រូនិច"
					prop="email"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.email"
						autocomplete="off"
						name="email"
						clearable
					/>
				</el-form-item>
				<el-form-item
					v-if="isShowPassword"
					label="ពាក្យសម្ងាត់"
					prop="password"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-input
						v-model="ruleForm.password"
						autocomplete="off"
						name="password"
						show-password
					/>
				</el-form-item>
				<el-form-item
					label="តួនាទី"
					class="sanfont-khmer"
					:label-width="formLabelWidth"
				>
					<el-select
						v-model="ruleForm.roles"
						placeholder="ជ្រើសរើស"
						class="text-left"
						name="roles"
						multiple
					>
						<el-option
							v-for="data in roles"
							:key="data"
							:label="data.name"
							:value="data.name"
						/>
					</el-select>
				</el-form-item>
			</div>
			<el-form-item
				label="រូបភាព"
				class="sanfont-khmer"
				:label-width="formLabelWidth"
			>
				<div>
					<el-upload
						class="avatar-uploader"
						action="#"
						name="file"
						:show-file-list="true"
						:auto-upload="false"
						:on-change="handleAvatarSuccess"
						:before-upload="beforeAvatarUpload"
					>
						<img
							v-if="imageUrl"
							:src="imageUrl"
							class="avatar 	object-contain "
						>
						<i
							v-else
							class="el-icon-plus avatar-uploader-icon"
						></i>
					</el-upload>
					<input
						type="hidden"
						name="photo_id"
						v-model="ruleForm.photo_id"
					>
				</div>
			</el-form-item>
		</el-form>
		<el-dialog v-model="dialogVisible">
			<img
				w-full
				:src="dialogImageUrl"
				alt="Preview Image"
			/>
		</el-dialog>
		<template #footer>
			<span class="dialog-footer">
				<el-button
					@click="cancelAction()"
					class="sanfont-khmer"
				> បោះបង់</el-button>
				<el-button
					v-if="!isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="submitForm('ruleForm')"
				>
					រក្សាទុក
				</el-button>
				<el-button
					v-if="isShowButtonUpdate"
					type="primary"
					class="sanfont-khmer"
					@click="updateData('ruleForm')"
				>
					រក្សាទុក
				</el-button>
			</span>
		</template>
	</el-dialog>
	<!-- Dialog user  -->

</template>
<script>

import { ElNotification, ElMessage } from 'element-plus'
export default {
	components: {},

	data() {
		var optionsLine = {
			series: [{
				name: 'សិស្សប្រុស',
				data: [31, 40]
			}, {
				name: 'សិស្សស្រី',
				data: [11, 32]
			}],
			chart: {
				height: 350,
				type: 'area'
			},
			dataLabels: {
				enabled: false
			},
			stroke: {
				curve: 'smooth'
			},
			xaxis: {
				type: 'string',
				categories: ["២០២១-២០២២", "២០២២-២០២៣"]
			},
			tooltip: {
				// x: {
				// 	format: 'dd/MM/yy HH:mm'
				// },
			},
		};
		var optionsColumn = {
			series: [{
				name: 'សិស្សប្រុស',
				data: [1900, 1900, 4800]
			},
			{
				name: 'សិស្សស្រី',
				data: [2500, 3600, 4800]
			}
			],
			chartOptions: {
				chart: {
					height: 350,
					type: 'bar',
				},
				plotOptions: {
					bar: {
						borderRadius: 10,
						dataLabels: {
							position: 'top', // top, center, bottom
						},
					}
				},
				dataLabels: {
					enabled: true,
					formatter: function (val) {
						return val + "នាក់";
					},
					offsetY: -20,
					style: {
						fontSize: '12px',
						colors: ["#304758"]
					}
				},

				xaxis: {
					categories: ["ថ្នាក់ទី១០", "ថ្នាក់ទី១១", "ថ្នាក់ទី១២"],
					position: 'top',
					axisBorder: {
						show: false
					},
					axisTicks: {
						show: false
					},
					crosshairs: {
						fill: {
							type: 'gradient',
							gradient: {
								colorFrom: '#D8E3F0',
								colorTo: '#BED1E6',
								stops: [0, 100],
								opacityFrom: 0.4,
								opacityTo: 0.5,
							}
						}
					},
					tooltip: {
						enabled: true,
					}
				},
				yaxis: {
					axisBorder: {
						show: false
					},
					axisTicks: {
						show: false,
					},
					labels: {
						show: false,
						formatter: function (val) {
							return val + "នាក់";
						}
					}

				},
				title: {
					text: '',
					floating: true,
					offsetY: 330,
					align: 'center',
					style: {
						color: '#444'
					}
				}
			},
		};

		var optionsAttendace = {
			series: [44, 55, 13, 43],
			chartOptions: {
				chart: {
					width: 380,
					type: 'pie',
				},
				labels: ['វត្តមាន', 'ច្បាប់', 'មកយឺត', 'អវត្តមាន'],
				responsive: [{
					breakpoint: 480,
					options: {
						chart: {
							width: 200
						},
						legend: {
							position: 'bottom'
						}
					}
				}]
			},
		};


		const tableData = [
			{
				date: '2016-05-03',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-02',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-04',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-01',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-08',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-06',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-07',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
		]
		return {
			tableData,
			showSuccess: false,
			showInfo: false,
			optionsLine,
			optionsColumn,
			optionsAttendace,
			academic: '2',
			academics: [
				{
					name: "ឆ្នាំសិក្សា២០២១-២០២២",
					id: '1',

				},
				{
					name: "ឆ្នាំសិក្សា២០២២-២០២៣",
					id: '2',

				}
			]
		}
	},
	computed: {

	},

	mounted() {
		// var chart = new ApexCharts(document.querySelector("#chart"), this.optionsColumn);
		// chart.render();
		// var chartAttendace = new ApexCharts(document.querySelector("#chartAttendace"), this.optionsAttendace);
		// chartAttendace.render();
	},
	methods: {
		notification() {
			this.showSuccess = !this.showSuccess
			ElNotification.success({
				title: 'Success',
				message: 'This is a success message',
				offset: 100,
			})
			ElMessage({
				message: 'Congrats, this is a success message.',
				type: 'success',
			})
		}
	}
}
</script>
<style scoped>
:global(h2#card-usage ~ .example .example-showcase) {
	background-color: var(--el-fill-color) !important;
}

.el-statistic {
	--el-statistic-content-font-size: 28px;
}

.statistic-card {
	height: 100%;
	padding: 20px;
	border-radius: 4px;
	background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	font-size: 12px;
	color: var(--el-text-color-regular);
	margin-top: 16px;
}

.statistic-footer .footer-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.statistic-footer .footer-item span:last-child {
	display: inline-flex;
	align-items: center;
	margin-left: 4px;
}

.green {
	color: var(--el-color-success);
}
.red {
	color: var(--el-color-error);
}
</style>