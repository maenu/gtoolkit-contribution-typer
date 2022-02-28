Extension { #name : #TypEdgePragmaKey }

{ #category : #'*Typer-GToolkit' }
TypEdgePragmaKey >> gtArgumentsFor: aView [

	<gtView>
	arguments ifEmpty: [ ^ aView empty ].
	arguments size = 1 ifTrue: [ 
		^ aView explicit
			  title: 'Argument';
			  priority: 10;
			  stencil: [ GtInspectorTool forObject: arguments first ] ].
	^ aView forward
		  title: 'Arguments';
		  priority: 10;
		  object: [ arguments ];
		  view: #gtItemsFor:
]
