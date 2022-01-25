Extension { #name : #TypInfAstNode }

{ #category : #'*Typer-GToolkit' }
TypInfAstNode >> typGtAsElementIn: aMondrian [

	^ self
		  typGtDecorate:
			  (GtPharoSnippetCoder forSource: node formattedCode)
				  asCoderUIModel collapse asElement
		  in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypInfAstNode >> typGtSourceCodeFor: aView [

	<gtView>
	^ aView forward
		  title: 'Node';
		  priority: 1;
		  object: [ node ];
		  view: #gtSourceCodeFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfAstNode >> typGtSourceFor: aView [

	<gtView>
	node methodNode ifNil: [ ^ aView empty ].
	node methodNode compiledMethod ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'Method';
		  priority: 2;
		  object: [ node methodNode compiledMethod ];
		  view: #gtSourceFor:
]
