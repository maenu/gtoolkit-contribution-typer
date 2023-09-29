Extension { #name : #ClassDescription }

{ #category : #'*Typer-Coverage' }
ClassDescription >> typGtCovFor: aView context: aDictionary [
	<gtClassView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren:
					{(BrLabel new
						aptitude: BrGlamorousLabelLook;
						text: 'methods';
						yourself).
					self typGtCovMethod typGtCovAsElement.
					(BrLabel new
						aptitude: BrGlamorousLabelLook;
						text: 'nodes';
						yourself).
					self typGtCovNode typGtCovAsElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-Coverage' }
ClassDescription >> typGtCovMethod [
	^ ((self methods , self classSide methods collect: #ast)
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-Coverage' }
ClassDescription >> typGtCovNode [
	^ ((self methods , self classSide methods
		flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]
