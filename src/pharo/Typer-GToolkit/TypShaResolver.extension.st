Extension { #name : #TypShaResolver }

{ #category : #'*Typer-GToolkit' }
TypShaResolver class >> typGtNewShadowFor: aClass [
	<typPraResult: 'TypShaShadow class'>
	<typPraArguments: 'ClassDescription'>
	| shadow |
	shadow := TypShaShadow
		subclass: 'Sha_' , aClass instanceSide name
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'Sha_'.
	shadow class
		compile:
			'shadowedClass
	^ ' , aClass instanceSide name , ' class'.
	^ shadow
]

{ #category : #'*Typer-GToolkit' }
TypShaResolver class >> typGtShadowFor: aClass [

	<typPraResult: 'SequenceableCollection<TypShaShadow class>'>
	<typPraArguments: 'ClassDescription'>
	^ self allSubclasses select: [ :e | 
		  e shadowedClass == aClass classSide ]
]

{ #category : #'*Typer-GToolkit' }
TypShaResolver class >> typGtShadowMethod: aSymbol result: aType arguments: someTypes in: aClass [

	<typPraArguments:
	'Symbol,TypType,SequenceableCollection<TypType>,ClassDescription'>
	| methods newSelector |
	methods := aClass methods select: [ :e | 
		           e typShaCanResolveMethod: aSymbol ].
	methods ifNotEmpty: [ ^ methods ].
	newSelector := self typGtShadowMethodNewSelector: aSymbol in: aClass.
	aClass compile: ('{1} aLookup
	<typShaMethod: ''{2}''>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ''{3}'' typAsType
		arguments: \{{4}\}' format: { 
				 newSelector.
				 aSymbol.
				 aType.
				 (' . ' join:
					  (someTypes collect: [ :e | '''{1}'' typAsType' format: { e } ])) }).
	^ { (aClass compiledMethodAt: newSelector asSymbol) }
]

{ #category : #'*Typer-GToolkit' }
TypShaResolver class >> typGtShadowVariable: aSymbol type: aType in: aClass [

	<typPraArguments: 'Symbol,TypType,ClassDescription'>
	| methods newSelector |
	methods := self class methods select: [ :e | 
		           e typShaResolvesVariable: aSymbol ].
	methods ifNotEmpty: [ ^ methods ].
	newSelector := self
		               typGtShadowVariableNewSelector: aSymbol
		               in: self class.
	self class compile: ('{1} aLookup
	<typShaVariable: ''{2}''>
	^ ''{3}'' typAsType' format: { 
				 newSelector.
				 aSymbol.
				 aType }).
	^ { (self class compiledMethodAt: newSelector) }
]

{ #category : #'*Typer-GToolkit' }
TypShaResolver class >> typGtShadowVariableNewSelector: aSymbol in: aClass [

	| newN newSelector |
	newSelector := self typGtShadowVariableSelector: aSymbol postfix: ''.
	newN := 1.
	[ aClass includesSelector: newSelector ] whileTrue: [ 
		newSelector := self
			               typGtShadowVariableSelector: aSymbol
			               postfix: newN.
		newN := newN + 1 ].
	^ newSelector
]

{ #category : #'*Typer-GToolkit' }
TypShaResolver class >> typGtShadowVariableSelector: aSymbol postfix: anObject [

	^ 'v{1}{2}:' format: { 
			  aSymbol capitalized.
			  anObject }
]
