Extension { #name : #TypInfState }

{ #category : #'*Typer-GToolkit' }
TypInfState >> typGtItemsFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Index';
		priority: -1;
		items: [ index associations ];
		column: 'Key'
			text: #key
			spawn: #key;
		column: 'Value'
			text: #value
			spawn: #value
]
