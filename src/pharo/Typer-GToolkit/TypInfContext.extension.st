Extension { #name : #TypInfContext }

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtAsCoderViewModel [
	^ node typGtAsCoderViewModelFor: self
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtCheColor [
	^ root typCheErrors ifEmpty: [ Color green ] ifNotEmpty: [ :c | c first color ]
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtCoderAndFlowFor: aView [
	<gtView>
	| coder mondrian |
	coder := self typGtAsCoderViewModel.
	mondrian := TypGtMondrian new.
	root typGtFlowPaintOn: mondrian.
	^ aView explicit
		title: 'Coder & Flow';
		priority: 10;
		stencil: [ | element |
			element := BlElement new.
			element userData
				at: #explainer
				put: ((TypGtExplainerElementContext on: element)
						isExplanationHolder: true;
						yourself).
			element
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				addChild: (coder asElement
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical matchParent ];
						yourself);
				addChild: (mondrian asElement
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical matchParent ];
						yourself);
				when: TypGtExpandContextRequest do: [ :e | coder announcer announce: e ];
				yourself ]
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtCoderFor: aView [
	<gtView>
	^ aView forward
		title: 'Coder';
		priority: 0;
		object: [ self typGtAsCoderViewModel asElement asScrollableElement ];
		view: #gtLiveFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtFlowFor: aView [
	<gtView>
	^ aView forward
		title: 'Control Flow';
		priority: 2;
		object: [ root ];
		view: #typGtFlowFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtHasCoderViewModel [
	^ true
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtIndicator [
	^ 'l:', lookup typGtIndicator
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtMinimalFlowFor: aView [
	<gtView>
	^ aView forward
		title: 'Minimal Flow';
		priority: 3;
		object: [ root ];
		view: #typGtMinimalFlowFor:
]
