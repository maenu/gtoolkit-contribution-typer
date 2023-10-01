Extension { #name : #TypCheWarning }

{ #category : #'*Typer-GToolkit' }
TypCheWarning >> typGtColor [
	self subclassResponsibility
]

{ #category : #'*Typer-GToolkit' }
TypCheWarning >> typGtFlowFor: aView [
	<gtView>
	^ aView forward
		title: 'Control Flow';
		priority: 1;
		object: [ node ];
		view: #typGtFlowFor:
]
