Extension { #name : #TypInfAstNode }

{ #category : #'*Typer-GToolkit' }
TypInfAstNode >> typGtSourceCodeFor: aView [

	<gtView>
	^ aView forward
		  title: 'Node';
		  priority: 2;
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
		  priority: 1;
		  object: [ node methodNode compiledMethod ];
		  view: #gtSourceFor:
]