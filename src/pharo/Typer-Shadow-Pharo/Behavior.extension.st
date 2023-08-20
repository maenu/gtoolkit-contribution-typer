Extension { #name : #Behavior }

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodAllSubclasses: aLookup [
	<typShaMethod: 'allSubclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType withParameters: {Behavior typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodBasicNew2: aLookup [
	<typShaMethod: 'basicNew:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodBasicNew: aLookup [
	<typShaMethod: 'basicNew'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodBinary83: aLookup [
	<typShaMethod: '>>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodCanUnderstand: aLookup [
	<typShaMethod: 'canUnderstand:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodClassVarNames: aLookup [
	<typShaMethod: 'classVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodCompile: aLookup [
	<typShaMethod: 'compile:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodCompiledMethodAt: aLookup [
	<typShaMethod: 'compiledMethodAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodIncludesBehavior: aLookup [
	<typShaMethod: 'includesBehavior:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Behavior typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodIncludesSelector: aLookup [
	<typShaMethod: 'includesSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodInheritsFrom: aLookup [
	<typShaMethod: 'inheritsFrom:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodInstVarNames: aLookup [
	<typShaMethod: 'instVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodLookupSelector: aLookup [
	<typShaMethod: 'lookupSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodMethodNamed: aLookup [
	<typShaMethod: 'methodNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodNew2: aLookup [
	<typShaMethod: 'new:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodNew: aLookup [
	<typShaMethod: 'new'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodSelectors: aLookup [
	<typShaMethod: 'selectors'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Symbol typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodSuperclass: aLookup [
	<typShaMethod: 'superclass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription superclass classSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodWhichClassDefinesClassVar: aLookup [
	<typShaMethod: 'whichClassDefinesClassVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodWhichClassDefinesInstVar: aLookup [
	<typShaMethod: 'whichClassDefinesInstVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodWithAllSuperclasses: aLookup [
	<typShaMethod: 'withAllSuperclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {ClassDescription typAsType})
]
