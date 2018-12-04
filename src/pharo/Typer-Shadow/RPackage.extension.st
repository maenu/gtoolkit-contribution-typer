Extension { #name : #RPackage }

{ #category : #'*Typer-Shadow' }
RPackage >> typShaAsMethodResolver [
	^ TypMethodResolvers new
		resolvers: ((self definedClasses select: [ :e | e inheritsFrom: TypShaShadow ]) flatCollect: #asMethodResolvers);
		yourself
]

{ #category : #'*Typer-Shadow' }
RPackage >> typShaAsTypeResolver [
	^ TypTypeResolvers new
		resolvers: ((self definedClasses select: [ :e | e inheritsFrom: TypShaShadow ]) flatCollect: #asTypeResolvers);
		yourself
]

{ #category : #'*Typer-Shadow' }
RPackage >> typShaAsVariableResolver [
	^ TypMethodResolvers new
		resolvers: ((self definedClasses select: [ :e | e inheritsFrom: TypShaShadow ]) flatCollect: #asVariableResolvers);
		yourself
]
