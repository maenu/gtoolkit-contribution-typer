Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsCompatibleType [
	| remains current |
	remains := self asSet copy.
	remains remove: TypUnknownType instance ifAbsent: [].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	current := remains anyOne.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains anyOne.
			remains remove: next.
			common := current withAllSuperTypes detect: [ :e | next <= e ].
			common == current
				ifFalse: [ current := common.
					remains add: current ] ].
	^ current
]
