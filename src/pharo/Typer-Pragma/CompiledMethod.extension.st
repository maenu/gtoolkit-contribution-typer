Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAllPragmas [
	^ self pragmas , (self overriddenMethods flatCollect: #pragmas)
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraHasMethodPragmas [
	^ self pragmas anySatisfy: #typPraIsMethod
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraHasTypePragmas [
	^ self pragmas anySatisfy: #typPraIsType
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraHasVariablePragma: aString [
	^ self pragmas anySatisfy: [ :e | e typPraIsVariable: aString ]
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraType [

	^ self pragmas
		  inject: (TypFunctionType
				   classDescription: self class
				   result: TypUnknownType instance
				   arguments:
				   (self numArgs typTimesCollect: [ :i | TypUnknownType instance ])
				   argumentsOptional: false
				   signalsAlways: nil)
		  into: [ :t :p | p typPraMethodInject: t ]
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraTypeInject: aType [
	^ self pragmas inject: aType into: [ :t :p | p typPraTypeInject: t ]
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraVariable: aString [
	^ (self pragmas detect: [ :e | e typPraIsVariable: aString ])
		typPraVariable
]
