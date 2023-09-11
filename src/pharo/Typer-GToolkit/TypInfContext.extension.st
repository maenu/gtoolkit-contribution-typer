Extension { #name : #TypInfContext }

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: self;
		forMethod: node compiledMethod;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtCoderFor: aView [
	<gtView>
	^ aView forward
		title: 'Method';
		priority: 1;
		object: [ self typGtAsCoder ];
		view: #gtLiveFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtFlowFor: aView [
	<gtView>
	^ aView forward
		title: 'Control Flow';
		priority: 10;
		object: [ root ];
		view: #typGtFlowFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtIndicator [
	^ 'l'
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtMinimalFlowFor: aView [
	<gtView>
	^ aView forward
		title: 'Minimal Flow';
		priority: 10;
		object: [ root ];
		view: #typGtMinimalFlowFor:
]
