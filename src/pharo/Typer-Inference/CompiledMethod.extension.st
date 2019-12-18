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
								and: [ e parent isMessage and: [ e parent arguments includes: e ] ] ] ] ])
		groupedBy: [ :e | method arguments detectIndex: [ :f | f name == e name ] ])
		associations
		collect: [ :e | 
			e key
				->
					(e value collect: [ :f | f parent typTypeForArgumentAt: e key ])
						typAsType ]) asDictionary.
	result
		argumentTypes:
			[ :i :a :s :r | argumentTypes at: i ifAbsent: [ TypUnknownType instance ] ].
	method typIsReturnSelf
		ifTrue: [ result resultType: [ :r :a | a receiverType ] ]
		ifFalse: [ (self isAbstract or: [ method isPrimitive ])
				ifTrue: [ nil ]
				ifFalse: [ | lastIsReturn types |
					lastIsReturn := method lastIsReturn.
					types := method typReturnNodes collect: #typType.
					result
						resultType: [ :r :a | 
							lastIsReturn
								ifTrue: [ types typAsType ]
								ifFalse: [ (types , {a receiverType}) typAsType ] ] ] ].
	^ result
]
