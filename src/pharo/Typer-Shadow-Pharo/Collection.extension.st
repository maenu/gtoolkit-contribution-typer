Extension { #name : #Collection }

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAdd: aLookup [
	<typShaMethod: 'add:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAddAll: aLookup [
	<typShaMethod: 'addAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAllSatisfy: aLookup [
	<typShaMethod: 'allSatisfy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAnySatisfy: aLookup [
	<typShaMethod: 'anySatisfy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAsDictionary: aLookup [
	<typShaMethod: 'asDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Dictionary typAsType
				withParameters: {(aLookup receiver at: #A) at: #A.
						(aLookup receiver at: #A) at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAsIdentitySet: aLookup [
	<typShaMethod: 'asIdentitySet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (IdentitySet typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAsOrderedCollection: aLookup [
	<typShaMethod: 'asOrderedCollection'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {(aLookup receiver at: #A) at: #A.
						(aLookup receiver at: #A) at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAsSet: aLookup [
	<typShaMethod: 'asSet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodBinary170: aLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup self
				withAt: #A
					put: {aLookup receiver at: #A.
							(aLookup arguments at: 1) at: #A} typAsType;
				yourself)
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodCopyWithout: aLookup [
	<typShaMethod: 'copyWithout:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodCopyWithoutAll: aLookup [
	<typShaMethod: 'copyWithoutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodDetect: aLookup [
	<typShaMethod: 'detect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodDetectIfFound: aLookup [
	<typShaMethod: 'detect:ifFound:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType.
				{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup receiver at: #A}
						argumentsOptional: true} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodDo: aLookup [
	<typShaMethod: 'do:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup self at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodGtItemsFor: aLookup [
	<typShaMethod: 'gtItemsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowView typAsType
		arguments: {GtPhlowView typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodIncludesAll: aLookup [
	<typShaMethod: 'includesAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodIsNotEmpty: aLookup [
	<typShaMethod: 'isNotEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodMax: aLookup [
	<typShaMethod: 'max'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodReject: aLookup [
	<typShaMethod: 'reject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodRemove: aLookup [
	<typShaMethod: 'remove:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodSelect: aLookup [
	<typShaMethod: 'select:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodSize: aLookup [
	<typShaMethod: 'size'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodWith: aLookup [
	<typShaMethod: 'with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver classDescription instanceSide typAsType
				withParameters: {aLookup arguments at: 1})
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodWithAll: aLookup [
	<typShaMethod: 'withAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver classDescription instanceSide typAsType
				withParameters: {(aLookup arguments at: 1) at: #A})
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodWithWith: aLookup [
	<typShaMethod: 'with:with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver classDescription instanceSide typAsType
				withParameters: {aLookup arguments typAsType})
		arguments: {TypUnknownType instance.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType} asOrderedDictionary
]
