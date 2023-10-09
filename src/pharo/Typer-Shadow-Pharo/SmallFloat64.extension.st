Extension { #name : #SmallFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary1: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary2: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary3: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary4: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary5: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary6: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetBinary7: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMetTruncated: aLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
