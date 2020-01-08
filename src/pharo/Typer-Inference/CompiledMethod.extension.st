Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsMethodLookupResult [
	| method result argumentTypes |
	method := self ast.
	result := TypMethodLookupResult new.
	argumentTypes := (((method allChildren
		select: [ :e | 
			e isArgument
				and: [ e typIsDeclaration not
						and: [ (method defines: e name)
								and: [ e parent isAssignment
										or: [ e parent isMessage and: [ e parent arguments includes: e ] ] ] ] ] ])
		groupedBy: [ :e | method arguments detectIndex: [ :f | f name == e name ] ])
		associations
		collect: [ :e | 
			e key
				->
					(e value
						collect: [ :f | 
							f parent isAssignment
								ifTrue: [ f parent variable typType ]
								ifFalse: [ f parent typTypeForArgumentAt: (f parent arguments indexOf: f) ] ])
						typAsType ]) asDictionary.
	result
		argumentTypes:
			[ :i :a :s :r | argumentTypes at: i ifAbsent: [ TypUnknownType instance ] ].
	method typIsReturnSelf
		ifTrue: [ result resultType: [ :a :s :r | a receiverType ] ]
		ifFalse: [ (self isAbstract not and: [ method isPrimitive not ])
				ifTrue: [ | types |
					types := method typReturnNodes collect: #typType.
					method lastIsReturn
						ifTrue: [ result
								resultType: [ :a :s :r | types typAsType ] ]
						ifFalse: [ result
								resultType:
									[ :a :s :r | (types , {a receiverType}) typAsType ] ] ] ].
	^ result
]
