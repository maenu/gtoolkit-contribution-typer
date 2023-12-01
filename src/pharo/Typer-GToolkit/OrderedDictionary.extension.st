Extension { #name : #OrderedDictionary }

{ #category : #'*Typer-GToolkit' }
OrderedDictionary >> typGtItemsFor: aView [
	<gtView>
	self at: #children ifAbsent: [ ^ aView empty ].
	^ aView columnedTree
		title: 'Tree' translated;
		priority: 10;
		expandSuchThat: [ true ];
		actionUpdateButton;
		items: [ self at: #children ];
		children: [ :d | d at: #children ];
		column: 'Contents' translated
			text: [ :d | String streamContents: [ :s | (d at: #start) node printOn: s ] ]
]
