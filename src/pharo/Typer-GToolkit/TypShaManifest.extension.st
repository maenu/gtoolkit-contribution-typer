Extension { #name : #TypShaManifest }

{ #category : #'*Typer-GToolkit' }
TypShaManifest class >> typGtIndexFor: aView [
	<gtClassView>
	<gtView>
	^ aView explicit
		title: 'Index';
		priority: 10;
		stencil: [ GtInspectorTool forObject: TypShaIndex instance ]
]

{ #category : #'*Typer-GToolkit' }
TypShaManifest class >> typGtStatisticsFor: aView [
	<gtClassView>
	<gtView>
	^ aView columnedList
		title: 'Statistics';
		priority: 10;
		items: [ (self package definedClasses
				collect: [ :c | c -> c instanceCount ]
				thenReject: [ :a | a value = 0 ]) sorted: [ :a :b | a value > b value ] ];
		column: '#'
			text: #value
			width: 45;
		column: 'Class'
			text: #key
			width: 400;
		send: #key;
		actionUpdateButton
]

{ #category : #'*Typer-GToolkit' }
TypShaManifest class >> typGtStatusChildren [
	^ {TypShaIndex hasInstance
			ifTrue: [ {1.
					''.
					#index.
					'initialized'.
					TypShaIndex instance.
					#()} ]
			ifFalse: [ {3.
					''.
					#index.
					'not initialized, build?'.
					nil.
					#()} ]}
]
