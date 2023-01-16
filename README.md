# DecalFakeShadow

Blob Shadow / Fake Shadow for URP12(Unity2021)

Fake Shadow��Blob Shadow�Ɠ��l��Top-Down��Cast Shadow���s���܂�.

![image](https://user-images.githubusercontent.com/57246289/202939728-7e953744-3027-43f2-b39e-61908bb2d6fe.png)

# Setup
- ScriptableRendererFeature�Ƃ���Decal��FakeShadowPass��ǉ����܂��B�iDecal��URP�̃v���Z�b�g�ł��j
- Decal Feature��"Technique"��"Screen Space"�ɁA"GBuffer"�𖳌��ɂ��܂��BDBuffer��GBuffer�̓T�|�[�g�O�ł��B
- Fake Shadow Pass Feature��"Character Layer"�͉e�𗎂Ƃ�Mesh��Layer��p�ӂ��ݒ肵�܂��B������Opaque Pass����͏��O���܂��B
![image](https://user-images.githubusercontent.com/57246289/212609523-417e78ff-c16c-4dec-9e75-c6ca53786937.png)
- Decal Projector��Scene�ɒǉ�����Material��"FakeShadowByDecal"�ɂ��܂��B
![image](https://user-images.githubusercontent.com/57246289/212609901-544a4999-5457-4c3e-9dca-e8be8b43e3cc.png)


## Blob Shadow
  Decal Projector��"BlobShadowByDecal"�܂��̓v���Z�b�g��Decal shader���Q�Ƃ���Material��ݒ肵�A�����ł��B

## Fake Shadow (with Shadow-Mesh)
�������ׂ̊֌W��Shadow Mesh��ʓr�p�ӂ��邱�Ƃ𐄏����܂��B
Shadow Mesh��1 Mesh����Low-Polygon�A�܂�Weight Bone�����Ȃ����邱�Ƃ��]�܂����ł��B
- Skinned Mesh��Ctrl+D��Duplicate���AMesh��Shadow Mesh�ɍ����ւ��܂��B
- Material��Runtime�Œ񋟂����ׁA�ݒ�͕s�v�ł��BMaterial�̐���Shadow Mesh��Sub Mesh���Ɉˑ����܂��B
- Shadow Mesh��GameObject��Fake Shadow Component��ǉ����܂��B
- Fake Shadow Component��Projector�ɑΉ�����Decal Projector��ݒ肵�܂��B
- Fake Shadow Component��Shadow Mesh��Toggle��Enable�ɂ��܂��B
![image](https://user-images.githubusercontent.com/57246289/212609970-c51e0b7c-02ad-49e7-bbbf-d5bd748ea792.png)

## Fake Shadow
Shadow Mesh�������ł��Ȃ��ꍇ�ASkinnedMesh��GameObject��Fack Shadow Component��ǉ����܂��B
- Mesh��Shader��FakeShadow pass��ǉ����܂��B
  �{�T���v���ł�SimpleLitFakeShadow shader���g�p���Ă��܂����A�v���Z�b�g��CBUFFER���g�p����̂�SRP Batcher����Ή��ƂȂ��Ă��܂��B
  SRP Batcher�Ή����s���ꍇ��_FakeShadowOffset��CBUFFER�ɒǉ����Ă��������B
- Skinned Mesh��GameObject��Fake Shadow Component��ǉ����܂��B
- Fake Shadow Component��Projector�ɑΉ�����Decal Projector��ݒ肵�܂��B
![image](https://user-images.githubusercontent.com/57246289/212609941-19730ade-c925-4698-934a-90185b77b7bc.png)
