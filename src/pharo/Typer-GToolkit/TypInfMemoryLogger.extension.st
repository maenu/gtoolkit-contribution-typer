Extension { #name : #TypInfMemoryLogger }

{ #category : #'*Typer-GToolkit' }
TypInfMemoryLogger >> typGtContextsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Contexts' translated;
		priority: 10;
		actionUpdateButton;
		items: [ (((recordings select: [ :s | s isKindOf: TypInfContextStopSignal ])
				groupedBy: #node) collect: [ :c | c sum: #duration ]) associations
				sorted: [ :a :b | a value > b value ] ];
		updateWhen: TypInfContextStopSignal in: [ announcer ];
		column: 'Duration' translated
			text: [ :a | a value ]
			width: 120;
		column: 'Contents' translated
			text: [ :c | String streamContents: [ :s | c printOn: s ] ]
]
