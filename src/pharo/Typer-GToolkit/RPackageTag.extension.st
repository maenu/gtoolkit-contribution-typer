Extension { #name : #RPackageTag }

{ #category : #'*Typer-GToolkit' }
RPackageTag >> typGtCovFor: aView context: aDictionary [
	<gtPackageTagView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren: {BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'methods';
							yourself.
						self typGtCovMethod typGtCovAsElement.
						BrLabel new
							look: BrGlamorousLabelAptitude;
							text: 'nodes';
							yourself.
						self typGtCovNode typGtCovAsElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
RPackageTag >> typGtCovMethod [
	| result |
	result := Dictionary new
		at: true put: IdentitySet new;
		at: false put: IdentitySet new;
		at: nil put: IdentitySet new;
		yourself.
	self classes
		do: [ :c | 
			c typGtCovMethod
				keysAndValuesDo: [ :k :v | (result at: k) addAll: v ] ].
	^ result
]

{ #category : #'*Typer-GToolkit' }
RPackageTag >> typGtCovNode [
	| result |
	result := Dictionary new
		at: true put: IdentitySet new;
		at: false put: IdentitySet new;
		at: nil put: IdentitySet new;
		yourself.
	self classes
		do: [ :c | 
			c typGtCovNode
				keysAndValuesDo: [ :k :v | (result at: k) addAll: v ] ].
	^ result
]
