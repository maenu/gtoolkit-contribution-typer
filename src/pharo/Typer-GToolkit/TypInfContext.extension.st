Extension { #name : #TypInfContext }

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtCompactFlowFor: aView [
	<gtView>
	^ aView forward
		title: 'Compact Flow';
		priority: 10;
		object: [ root ];
		view: #typGtCompactFlowFor:
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
TypInfContext >> typGtSourceFor: aView [
	<gtView>
	^ aView forward
		title: 'Method';
		priority: 1;
		object: [ root ];
		view: #typGtSourceFor:
]
