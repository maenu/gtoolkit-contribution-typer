Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfType [
	| ast argumentTypes resultType signalsAlways |
	ast := self ast.
	argumentTypes := (((ast allChildren
		select: [ :e | 
			e isArgument
				and: [ e isDefinition not
						and: [ (ast defines: e name)
								and: [ e parent isAssignment
										or: [ e parent isMessage and: [ e parent arguments includes: e ] ] ] ] ] ])
		groupedBy: [ :e | ast arguments indexOf: e ]) associations
		collect: [ :e | 
			e key
				->
					(e value
						collect: [ :f | 
							f parent isAssignment
								ifTrue: [ f parent variable typType ]
								ifFalse: [ f parent typInfTypeForArgumentAt: (f parent arguments indexOf: f) ] ])
						typAsType ]) asDictionary.
	ast typInfIsReturnSelf
		ifTrue: [ resultType := ast typInfSelf ]
		ifFalse: [ (self isAbstract not and: [ ast isPrimitive not ])
				ifTrue: [ | types |
					types := ast typInfReturnNodes collect: #typType.
					ast lastIsReturn
						ifTrue: [ resultType := types typAsType ]
						ifFalse: [ resultType := (types , {ast typInfSelf}) typAsType ] ] ].
	self flag: 'FIXME this is a mess'.
	^ resultType
]
